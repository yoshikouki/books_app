# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # ロケール振り分けを全てのアクションで実行
  around_action :switch_locale

  # DeviseのStrongParameterを受け付ける
  before_action :configure_permitted_parameters, if: :devise_controller?

  # paramsのロケールによる振り分け
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  # url_for関係メソッドでロケールを設定するよう上書き
  def default_url_options
    { locale: I18n.locale }
  end

  protected

  # Devise StrongParameterに独自属性を追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name zip_code address biography avatar])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name zip_code address biography avatar])
  end
end
