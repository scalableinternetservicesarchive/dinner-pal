class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_indexes, only: [:edit, :update]

  def index
    @users = User.all
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_user_path(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def set_indexes
      @indexes = Set[:email, :reset_password_token, :confirmation_token, :unlock_token]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      schema = (User.column_names.map &:to_sym).to_set
      permitted_params = schema - @indexes
      params.require(:user).permit(permitted_params)
    end
end