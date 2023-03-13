class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
    @received_invitations = @invitations.select do |invitation|
      invitation.user == current_user && invitation.accepted == "Pending"
    end
  end

  def create
    @event = Event.find(params[:event_id])
    invitees = params["users"]
    invitees.each do |invitee|
      user = User.find_by(email: invitee)
      Invitation.create(event: @event, user: user)
    end
    redirect_to event_path(@event)
  end

  def update
    @invitation = Invitation.find(params[:id])
    @invitation.accepted = "Accepted"
    @invitation.save
    redirect_to invitations_path
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to invitations_path
  end

end
