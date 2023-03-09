class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
    @received_invitations = @invitations.select do |invitation|
      invitation.user == current_user && invitation.accepted == false
    end
  end

  def create
    # @event = Event.find(params[:event_id])
    # array_of_ids = #
    # @users = User.where(#array of ids coming from form)
    # @users.each do |user|
    #   Invitation.new(event: @event, user: user)
    #   Invitation.save
    # end
  end

  def update
    @invitation = Invitation.find(params[:id])
    @invitation.accepted = true
    @invitation.save
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to invitations_path
  end

end
