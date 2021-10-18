
module SessionHelper
  # Verifica se tem alguém logado no sistema.
  def isLogged?
    session[:logged]
  end

  # Usuário atual que está logado. Caso ninguém esteja logado, nil.
  def current_user
    unless isLogged? then return nil end
    user = User.find_by id: session[:user_id]
    return user
  end

  # Verifica se o usuário atual é um dos tipos fornecidos
  def hasPermission? *kinds
    user = current_user
    if user == nil then return false end
    return kinds.include? user.kind.to_sym
  end

  # Associa um usuário à sessão, caso ninguém esteja.
  def connect user
    if isLogged? then return end
    session[:logged] = true
    session[:user_id] = user.id
  end

  # Desloga quem estiver logado na sessão.
  def disconnect_user
    session[:logged] = false
    session[:user_id] = nil
  end
end