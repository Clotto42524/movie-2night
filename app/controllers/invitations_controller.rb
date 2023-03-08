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
  end

  def update

  end
end
