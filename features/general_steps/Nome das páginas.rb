
# Este arquivo define uma hash que relaciona o nome de todas as páginas aos seus respectivos endereços.
# Note que a página final pode ser definida como uma expressão regular; por outro lado, o mesmo não é válido para o nome.
# Use artigos definidos somente em strings e artigos indefinidos em expressões regulares.

$page_urls = {
  'a página de administração de coaches'  => '/admin/list/coaches',
  'a página de afiliação'                 => '/affiliate',
  'a página de alunos'                    => '/meus_alunos', # Quebra de padrão
  'a página de cadastro'                  => '/register',
  'a página de detalhes do coach 1'       => '/lol/coaches/1',
  'a página de edição de cadastro'        => '/infos/1', # Perigoso!
  'a pagina de listagem de coaches'       => '/lol/coaches',
  'a página de login'                     => '/login',
  'a página inicial'                      => '/',
  'a página de solicitações de afiliação' => '/admin/affiliate',
  'o painel administrativo'               => '/admin/',
  'minha área pessoal'                    => '/me',
  'uma pagina de detalhes de coach'       => /coaches\/\d/, # Resolvi aquele seu problema com o details, Paulao =D
}

def url_of(page_name)
  res = $page_urls[page_name]
  unless res == nil
    return res
  end
  raise("Não existe uma página com o nome \"#{page_name}\". Verifique a ortografia ou consulte o arquivo em ./features/Nome das páginas.rb.")
end