class  Api::V1::RegistrationsController < Devise::RegistrationsController
  before_action :permit_all_params
  def create
    # debugger
    user = User.new(sign_up_params)

    if user.save
    token = JWT.encode({user_id: User.find_by(email: sign_up_params['email']).id}, 's3cr3t')

    puts token
    puts user.id
    cart = Cart.create[:user_id]
      render json: token.to_json
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end


  private
  def sign_up_params
    params.except('controller', 'action')
  end

  def permit_all_params
    params.permit!
  end  

end	