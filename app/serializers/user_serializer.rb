class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :email, :profile_picture

  def profile_picture
    return unless object.profile_picture.attached?

    object.profile_picture.blob.attributes
        .slice('filename', 'byte_size')
        .merge(url: profile_picture_url)
        .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  def profile_picture_url
    url_for(object.profile_picture)
  end
end
