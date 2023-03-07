class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
    @received_invitations = @invitations.select do |invitation|
      invitation.user == current_user && invitation.accepted == false
    end
  end

  def create

  end

  def update

  end
end
