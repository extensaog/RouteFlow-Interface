RouteFlow-Interface
===================

Extensão da Interface gráfica - Turma de Redes 2013/1 Prof. Marcondes


RouteFlow: Extensão da Interface Gráfica

Maykon Rocha Santana1, Danilo Codeco Carvalho1, Alessander França Queiroz da Costa1, Cédrick Bamba Nsimba1, Guilherme Picanço Rabello1

1Departamento de Computação – Universidade Federal São Carlos (UFSCar)

São Carlos – SP – Brazil

1{ maykonacademic, danilocodeco, alessander70, cedrick.bamba, rabellogp}@gmail.com

Resumo. Este documento faz uma contextualização do projeto RouteFlow e de como se dará o desenvolvimento do trabalho da disciplina de Rede de Computadores do Programa de Pós-Graduação em Ciência da Computação - PPGCC da UFSCar ministrada pelo professor Dr. Cesar Marcondes que tem como tema a Extensão da Interface Gráfica do Projeto RouteFlow.

<b>Introdução</b>

Segundo a CISCO (companhia multinacional estadunidense líder mundial no ramo das Telecomunicações) o número de dispositivos conectados a internet será superior a 15 bilhões, ou seja, o dobro da população mundial em 2015[3], provocando, assim, um gargalo na internet que implica na necessidade do desenvolvimento de novas implementações que venham a melhorar o trafego dos dados na rede mundial.
          Virtualização de recursos de rede, novas arquiteturas de roteamento e Redes Definidas por Software são exemplos de pesquisas que estão sendo desenvolvidas nessa área no que vem sendo chamado de Redes do Futuro.
        	 Essas pesquisas visam sanar um problema das redes atuais. Há dificuldade em se implementar soluções baratas e abertas, pois o que se vê é a utilização de dispositivos de código proprietário e implementações em hardware que dificultam o desenvolvimento de novas aplicações. Nesse contexto, a ausência de flexibilidade e o alto custo da infraestrutura vigente são barreiras que dificultam o avanço das redes e a inovação [2].
        	Pensando nisso, o Centro de Pesquisa e Desenvolvimento em Telecomunicações, CPqD, juntamente com a Faculdade de Engenharia Elétrica da Unicamp – SP propuseram o RouteFlow que é um projeto de roteamento remoto centralizado que visa o desacoplamento entre o plano de encaminhamento e o plano de controle, tornando as redes IP mais flexíveis pela facilidade da adição, remoção e especialização de protocolos e algoritmos focando simultaneamente em questões de desempenho, flexibilidade e custo [1].
        	O RouteFlow está em desenvolvimento em várias frentes de trabalho e conta com a colaboração da UFSCar na pessoa do professor Dr. Cesar Marcondes, o qual, juntamente com os alunos da turma onde leciona a disciplina de Redes de Computadores no PPGCC, visa desenvolver projetos em determinadas áreas do RouteFlow. Dentre essas áreas encontra-se a área de Extensões da Parte Gráfica, a qual será o tema deste trabalho.

<b>Projeto de Extensão da Interface Gráfica no RouteFlow</b>

No projeto RouteFlow, a interface gráfica auxilia os desenvolvedores no controle da infraestrutura, monitorando o sistema remotamente via Interface Web. Nela, os desenvolvedores são capazes de interagir com a interface gráfica para que os testes sejam executados da melhor maneira possível. Essa Interface permite a inspeção da topologia utilizada nas VMs (Virtual Machines) apresentando também estatísticas do processo [4].
        	O objetivo do trabalho será o de propor melhorias a essa interface, como adição de novos recursos que facilitem ainda mais a iteração entre os desenvolvedores e o sistema. Outro fator importante é que essa interface também propiciará uma facilidade na obtenção de dados estatísticos, pois possibilitará uma maior compreensão do que ocorre no sistema para eventuais melhorias que possam vir a ser implementadas, visando o aperfeiçoamento da tecnologia.
	
	#### Ferramenta Utilizadas 
	
Definiu-se que a interface gráfica proposta deve ser implementada com uso do Grails, framework web de alta produtividade para a plataforma Java, e HTML5.
O Grails permite o isolamento do desenvolvedor dos detalhes complexos da persistência de dados e incorpora o padrão de desenvolvimento MVC de maneira natural. Ele também fornece templates web para fácil implementação da interface com o usuário e suporte para programação em Ajax.
O HTML5 é uma linguagem para estruturação e apresentação de conteúdo para a World Wide Web e é uma tecnologia chave da Internet originalmente proposto por Opera Software.1 É a quinta versão da linguagem HTML. Esta nova versão traz consigo importantes mudanças quanto ao papel do HTML no mundo da Web, através de novas funcionalidades como semântica e acessibilidade. Dentre os novos recursos dessa versão está o Canvas, para a renderização local de desenhos 2D que permitem a economia de banda e fácil padronização de layouts. Esse recurso mostrou-se útil no desenho das topologias de rede a serem mostradas nessa interface gráfica.


<b>Funcionamento da Interface</b>

	#### InterfaceController

No projeto Routeflow do Grails, foi usado um controlador chamado InterfaceController definindo apenas a página index (def index()). Dentro dessa definição da index é feita a leitura dos arquivos de teste rftest1 e rftest2. Para leitura dos roteadores que são usados nos testes é utilizada uma função que encontra todos os índices de ocorrência da substring desejada. A função utilizada para encontrar todos o índices é mostrada abaixo:

String.metaClass.indexesOf = { match ->
			def ret = []
			def idx = -1
			while( ( idx = delegate.indexOf( match, idx + 1 ) ) > -1 ) {
			  ret << idx
			}
			ret
		  }
		  
Encontrados todos os índices de ocorrência, nos rftests, deve-se encontrar a substring do índice e separar essa string para encontrar o roteador. Nos rftests, o comando de inicialização é 'lxc-start -n roteador -d'. No rftest1 por exemplo, existem três comandos de inicialização. Para isso é necessário encontrar um vetor com todos os índices de ocorrência e logo depois encontra-se a substring inteira. Em seguida é usada uma função tokenize() para transformar um string em um vetor de palavras. O tokenize() pega a substring 'lxc-start -n roteador -d' e gera um vetor ['lxc-start', '-n', 'roteador', '-d']. Para encontrar o roteador basta pegar o terceiro elemento, no caso vetor[2].

O exemplo abaixo gera um vetor com os roteadores do rftest1 e do rftest2:

for(int i = 0; i < fileContents2.size(); i++){
	start << rftest1.substring(fileContents2[i], fileContents2[i]+25).tokenize()[2]

}

for(int i = 0; i < fileContents3.size(); i++){
	start << rftest2.substring(fileContents3[i], fileContents3[i]+25).tokenize()[2]

}

Sabendo quais são os roteadores, pode-se ler os endereços MACs pertencentes a cada um deles lendo os arquivos de configuração de cada um, usando o procedimento acima.

Finalmente os vetores contendo os roteadores e MACs são retornados para a página index.html

	#### index.html

Nessa página de visualização da topologia, foi usada a tag canvas do html5 para desenhar todos os roteadores, ligações e máquinas virtuais ligadas. 
Código do canvas usado na interface da topologia:
<canvas id="myCanvas" width="1050" height="1000" 
		style="border:1px solid #000000;">
		
Para desenhar a topologia do rftest1 e rftest2 foi usada a função desenhaTopologia() que tem como parâmetros os roteadores e endereços ip dos roteadores, além de uma variável que especifica se desenha a topologia para o rftest1 ou rftest2. Os valores dos roteadores e seus endereços MAC lidos e salvos no InterfaceController são usados nessa função para inserir corretamente esses valores na representação da topologia. 

Em geral, com o grails pode-se processar os dados de leitura no controlador e separadamente implementar a interface em javascript junto com html5 na index. O uso do canvas foi bem favorável para a implementação da interface porque não houve nenhum carregamendo de imagens para representação da topologia, obtendo-se um melhor desempenho na execução da função desenhaTopologia().

<b>Referências</b>

[1] Nascimento, M. R., Rothenberg, C. E., Salvador, M. R., Denicol, R. R. and Magalhães, M. F. (2010). RouteFlow: Roteamento Commodity Sobre Redes Programáveis. XXIX Simpósio Brasileiro de Redes de Computadores e Sistemas Distribuídos
[2] Rob Sherwood, Glen Gibby, K.-K. Y. G. A. M. C. N. M. G. P. (2010). Can the production network be the testbed? OSDI’10, pages 1–14. USENIX Association.
[3]http://oglobo.globo.com/tecnologia/numero-de-dispositivos-conectados-sera-superior-ao-dobro-da-populacao-mundial-em-2015-diz-pesquisa-2878711 acessado em 03 de abril de 2013
[4] https://sites.google.com/site/routeflow/ acessado em 26 de abril de 2013
[5]https://www.cpqd.com.br/imprensa-e-eventos/press-releases/5827-redes-do-futuro-sao-tema-de-workshop-no-cpqd.html acessado em 26 de março de 2013
