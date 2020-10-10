module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from NoMemoryError, ScriptError, SignalException, StandardError, SystemExit do |exception|
      render json: { code: 500, message: 'Internal Server Error' }, status: 500
    end

  private
    def process_action(*args)
      super
    rescue ActionDispatch::Http::Parameters::ParseError => exception
      render json: { code: 400, message: 'Bad Request' }, status: 400
    end
  end
end
