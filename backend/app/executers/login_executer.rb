# frozen_string_literal: true

class LoginExecuter
  def initialize(user)
    @user = user
    @errors = []
  end

  def execute
    validation = Login::Validation.new(@user).validate
    (@errors.concat validation.instance_variable_get(:@errors)) && (return self) unless validation.instance_variable_get(:@errors).blank?

    admin = Login::SelectAdmin.new(@user).select
    (@errors.concat admin.instance_variable_get(:@errors)) && (return self) unless admin.instance_variable_get(:@errors).blank?

    token = Login::TokenEncoder.new('admin_id' => admin.instance_variable_get(:@admin).id,
                                    'permission_number' => admin.instance_variable_get(:@admin).permission_number).generate_token
    (@errors.concat token.instance_variable_get(:@errors)) && (return self) unless token.instance_variable_get(:@errors).blank?

    Login::Redis.new(token.instance_variable_get(:@response)).insert_token

    @response = token.instance_variable_get(:@response)
    self
  end
end
