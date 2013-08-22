class UsersController < ApplicationController
  #skip_before_filter :require_login, :only => [:index, :new, :create, :activate]
  filter_resource_access

  def index
    @per_page = params[:per_page] || 15
    @users = User.paginate( :per_page => @per_page, :page => params[:page] )
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		redirect_to root_url, :notice => "Signed up!"
  	else
  		render :new
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      if(current_user.roles.include?("publication_group"))
        redirect_to users_url
       else
        redirect_to root_url
       end
     else
      render :action => 'edit'
    end    
  end

	def activate
	  if (@user = User.load_from_activation_token(params[:id]))
	    @user.activate!
	    redirect_to(login_path, :notice => 'User was successfully activated.')
	  else
	    not_authenticated
	  end
	end

end
