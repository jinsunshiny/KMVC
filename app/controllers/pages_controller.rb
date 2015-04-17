class PagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:login]

  def home
  end

  def church_introduce
  end

  def page_test
    logger.error 'session before'
    if session[:user_id] != nil
      logger.error 'session on'
    end
    logger.error 'session after'
  end

  def login
    #TODO : login 프로세스 넣기
    user = User.find_by_user_id(params[:id])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.user_id
    end

    redirect_to page_test_url

    #TODO : DB에서 조회하여 로그인 완료 여부 체크
    #TODO : 성공시 세션 발급
  end
end
