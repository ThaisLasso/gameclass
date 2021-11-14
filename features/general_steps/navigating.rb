
# Ações relacionadas à navegação.

# Garante que ele esteja em uma página.
# Feito para funcionar tanto com "dado que eu estou 'na' página X" quanto com "dado qeu eu estou 'em a' página X"
Dado /^que eu estou ([n(em )])([^"]*)$/ do |_, page|
  url = get_url page
  visit url
  expect(current_url).to match url
end

# Tenta acessar uma página.
Quando /^eu tento acessar ([^"]*)$/ do |page|
  visit get_url page
end

# Garante o acesso a uma página ou avisa caso não seja possível.
Quando /^eu acesso ([^"]*)$/ do |page|
  url = get_url page
  visit url
  expect(current_url).to match url
end

Então /^eu deveria ser redirecionado para ([^"]*)$/ do |page|
  expect(current_path).to match get_url page
end

Então /^eu não deveria ser redirecionado para ([^"]*)$/ do |page|
  expect(current_path).to_not match get_url page
end