#language: pt

Funcionalidade: Botão de solicitar afiliação
  Como aluno
  De modo que eu possa acessar a página de solicitar afiliação
  Quero um botão "solicitar afiliação" na minha área pessoal

  Cenário: O botão existe
    Dado que eu sou cadastrado como administrador
    Dado que eu estou logado
    Quando eu acesso minha área pessoal
    Então eu deveria ver um botão "Solicitar afiliação"

  Cenário: O botão me leva para a página de solicitar afiliação
    Dado que eu sou cadastrado como aluno
    Dado que eu estou logado
    Quando eu acesso minha área pessoal
    E eu clico no botão "Solicitar afiliação"
    Então eu deveria ser redirecionado para a página de afiliação