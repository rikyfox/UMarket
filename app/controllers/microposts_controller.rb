class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :vendor_user
  before_action :correct_user,   only: :destroy

  def create
    if current_user.vendor?
        @micropost = current_user.microposts.build(micropost_params)  #Note the use of strong parameters via micropost_params, which permits only the micropost’s content attribute to be modified through the web.
        if @micropost.save
            flash[:success] = "Micropost created!"
            redirect_to root_url # == static_pages/home
        else
            @feed_items = []
            render 'static_pages/home'
        end
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
        params.require(:micropost).permit(:content, :picture)  # list of attributes permitted to be modified through the web
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

end
