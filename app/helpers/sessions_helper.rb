# automatycznie sie includuje do widokow zwiazanych z session, ale nie do kontrolerow, wiec bedziemy musieli to zaincludowac do controlera
module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user  # wywolaj statycznie funkcje przypisujaca... ah ten ruby, widac jak dziala w sumie.
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token]) # jesli @current user istnieje to go zwroci, jesli nie, to wyszuka go w bazie i z przypisze i dopiero zwroci

  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end



end

