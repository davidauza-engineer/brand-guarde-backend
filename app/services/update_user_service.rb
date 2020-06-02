class UpdateUserService
  def initialize(user, params)
    @user = user
    @params = params
  end

  def call
    if @params[:profile_picture] && !file?(@params[:profile_picture])
      delete_profile_picture if @user.profile_picture.attached?
      @params.delete(:profile_picture)
    end
    @user.update(@params)
  end

  private

  def file?(param)
    param.is_a?(ActionDispatch::Http::UploadedFile)
  end

  def delete_profile_picture
    @user.profile_picture.purge
  end
end
