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
    if invitees.nil?
      render "events/users", status: :unprocessable_entity
    else
      invitees.each do |invitee|
        user = User.find_by(email: invitee)
        Invitation.create(event: @event, user: user)
      end
    redirect_to event_path(@event)
    end
  end

  def update
    @invitation = Invitation.find(params[:id])
    @event = @invitation.event
    @invitation.accepted = "Accepted"
    if @invitation.save
      EventChannel.broadcast_to(
        @event, { id: @invitation.id,
                  html_element: render_to_string(partial: "accepted_status", locals: { invitation: @invitation }) }
      )
      head :ok
    else
      render "invitations/index", status: :unprocessable_entity
    end
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to invitations_path
  end
end
