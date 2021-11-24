class MembershipsController < ApplicationController
  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.create(memberships_params)
    @membership.user = current_user
    if @membership.save!
      redirect_to(membership_path(@membership))
    else
      render :new
    end
  end

  private

  def memberships_params
    params.require(:membership).permit(:total_points)
  end
end
