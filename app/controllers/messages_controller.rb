class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
    render component: 'Messages', props: { messages: @messages }, tag: 'span', class: 'messages'
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    render component: 'Message', props: { message: @message }, tag: 'span', class: 'message'
  end

  # GET /messages/new
  def new
    @message = Message.new
    render component: 'NewMessage', props: { message: @message, action: "new" }.merge(auth_params), tag: 'span', class: 'message'
  end

  # GET /messages/1/edit
  def edit
    render component: 'EditMessage', props: { message: @message, action: "new" }.merge(auth_params), tag: 'span', class: 'message'
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content)
    end

    def auth_params
      { csrf_param: request_forgery_protection_token,
        csrf_token: form_authenticity_token }
    end
end
