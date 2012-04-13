class ArticlesController < ApplicationController
  
  # GET /articles
  # GET /articles.xml
  def index
    @articles = if request.xhr?
      if params[:super_edition]
        Article.all
      else
        Article.where(:marked_as_free => true).limit(10)
      end
    else
      Article.all
    end
      

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render_for_api :question_answer, :xml => @articles, :root => :articles }
      format.json { render_for_api :question_answer,:json => @articles,:root => :articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render_for_api :question_answer, :xml  => @article }
      format.json { render_for_api :question_answer, :json => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end
  
  def store_answer
    puts params.inspect
    
    email = params["email"] || ""
    question_id = params["question_id"] || ""
    difficulty = params["difficulty"] || ""
    answer = params["user_answer"] || ""
    
    response = '<div id="question_answered" data-role="page" data-theme="a" data-content-theme="a">
      <div data-role="header">
          <h1>Submit Answer</h1>
      </div>
      <div data-role="content">'
    
    if answer.blank?
      response += '<div class="ui-bar ui-bar-e"><h3>Whoops! Form submission failed. You need to provide an answer! <a href="#" data-rel="back" data-role="button">Back</a></h3>'
    else
      UserAnswer.create(:email => email, :question_id => question_id, :difficulty => difficulty, :answer => answer)
      response += '<h3>Thanks for submitting an answer. <a href="#question_list" data-role="button">Questions</a></h3>'
    end    

    response += '</div></div>'
    
    render :text => response, :status => 200
  end
  
end
