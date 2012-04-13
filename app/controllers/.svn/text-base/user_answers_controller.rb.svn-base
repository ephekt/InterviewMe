class UserAnswersController < ApplicationController
  # GET /user_answers
  # GET /user_answers.xml
  def index
    @user_answers = UserAnswer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_answers }
    end
  end

  # GET /user_answers/1
  # GET /user_answers/1.xml
  def show
    @user_answer = UserAnswer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_answer }
    end
  end

  # GET /user_answers/new
  # GET /user_answers/new.xml
  def new
    @user_answer = UserAnswer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_answer }
    end
  end

  # GET /user_answers/1/edit
  def edit
    @user_answer = UserAnswer.find(params[:id])
  end

  # POST /user_answers
  # POST /user_answers.xml
  def create
    @user_answer = UserAnswer.new(params[:user_answer])

    respond_to do |format|
      if @user_answer.save
        format.html { redirect_to(@user_answer, :notice => 'User answer was successfully created.') }
        format.xml  { render :xml => @user_answer, :status => :created, :location => @user_answer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_answers/1
  # PUT /user_answers/1.xml
  def update
    @user_answer = UserAnswer.find(params[:id])

    respond_to do |format|
      if @user_answer.update_attributes(params[:user_answer])
        format.html { redirect_to(@user_answer, :notice => 'User answer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_answers/1
  # DELETE /user_answers/1.xml
  def destroy
    @user_answer = UserAnswer.find(params[:id])
    @user_answer.destroy

    respond_to do |format|
      format.html { redirect_to(user_answers_url) }
      format.xml  { head :ok }
    end
  end
end
