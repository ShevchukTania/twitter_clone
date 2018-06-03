module UsersHelper

  def user_avatar(user)
     if user.avatar?
       link_to ( image_tag user.avatar.url(:mini), class: 'gravatar'), user_path(user)
     else
       link_to image_tag('https://cs.pikabu.ru/images/big_size_comm/2013-12_1/13862236757361.jpg', size: '50x50'), user_path(user), class: 'gravatar'
     end
  end
  
end
