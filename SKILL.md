---
name: planejar-app-supabase
description: Entrevistar pessoas em linguagem simples e preparar pequenos aplicativos web para execução pelo AISDD. Use ao planejar um novo app com React/Vite, shadcn/ui, Supabase e Cloudflare Pages, especialmente quando precisar de PWA, autenticação, banco, Storage, ambientes isolados de homologação e produção, validação de acessos, documentação incremental e Git local. Não use para iniciar implementação sem autorização explícita do usuário.
---

# Planejar App Supabase

Conduza uma descoberta acolhedora, crie documentação AISDD continuamente e deixe o projeto pronto para implementação futura. Fale de forma não técnica; explique termos apenas quando a pessoa os usar ou quando a decisão depender deles.

## Regras inegociáveis

- Não escreva código do aplicativo, crie recursos na nuvem, envie deploys ou aplique migrations antes de o usuário dizer explicitamente que quer começar o desenvolvimento.
- Crie e atualize a documentação AISDD durante a conversa, assim que houver informação estável suficiente. Não espere a entrevista terminar.
- Assim que houver o primeiro conjunto útil de documentação e uma pasta de projeto definida, inicialize Git, use o AISDD para estruturar o repositório e faça um commit inicial. Depois, faça um commit separado após cada atualização de documentação ou entrega aprovada.
- Antes de usar `$aisdd`, verifique se a skill está disponível. Se não estiver, recomende sua instalação a partir de `https://github.com/pettersondiniz/aisdd`; nunca a instale sem autorização. Quando disponível, use-a para classificar e estruturar o trabalho. A fundação de um novo aplicativo com persistência, autenticação e dois ambientes normalmente é T3.
- Para interface visível, aplique a rota Impeccable indicada pelo AISDD. Se a skill não estiver disponível, ofereça sua instalação a partir de `https://github.com/pbakaus/impeccable`; nunca instale sem autorização.
- Não ofereça GitHub. Ajude a configurar ou publicar no GitHub somente se o usuário pedir.

## Fluxo de conversa

1. Comece pelo resultado desejado, pessoas que usarão o app e problema resolvido. Use as perguntas de [entrevista](references/entrevista.md) somente quando forem relevantes.
2. Registre decisões confirmadas, suposições e perguntas em aberto. Quando já houver conteúdo útil, peça ou confirme a pasta e o nome do projeto, inicialize o repositório e crie os primeiros artefatos AISDD.
3. Faça perguntas em pequenas etapas. Não exija que a pessoa conheça tecnologia, modelo de dados ou termos de infraestrutura.
4. Leia [ambientes e autenticação](references/ambientes-e-autenticacao.md) ao decidir login, e-mail, Google, dados, funções, Storage ou deploy.
5. Execute `scripts/Test-AppEnvironment.ps1` para verificar ferramentas e sessões sem mostrar valores confidenciais. Oriente a correção do que faltar e registre apenas o estado de prontidão.
6. Quando objetivo, fluxo principal, dados, autenticação, ambientes e experiência visual forem suficientes para a primeira versão, apresente um resumo e ofereça: começar desenvolvimento ou refinar fluxos, interface, dados/permissões, custos ou ambientes.
7. Só após a autorização explícita, entregue os milestones aprovados ao AISDD e retome da primeira fase incompleta.

## Estrutura inicial do projeto

Quando o projeto estiver pronto para receber documentação:

1. Crie a pasta acordada e inicialize Git local, se ainda não existir.
2. Execute `python <caminho-do-aisdd>/scripts/init_project.py <repo>`.
3. Crie a feature de fundação pelo script AISDD com a classificação adequada e preencha `spec.md`, `plan.md` e `status.md` com as decisões já tomadas.
4. Use `evidence.md` para a preparação verificada e mantenha `verification.json` para as validações que forem adicionadas durante a implementação.
5. Faça `git add` somente de arquivos sem segredos, revise o status e crie um commit descritivo.

Não trate a criação de documentação, configuração de ferramentas ou commit inicial como autorização para implementar o app.

## Padrões técnicos

- Use React, Vite e TypeScript para a SPA; use shadcn/ui e mantenha a aplicação instalável como PWA.
- Pergunte sempre qual será o tema inicial: claro, escuro ou o do sistema. Quando houver preferência salva por usuário, ela prevalece sobre o padrão.
- Quando a pessoa escolher um estilo no shadcn, peça que acesse `https://ui.shadcn.com/create` e envie o link gerado ou o código. Considere o preset Sera/Zinc/Sky, Noto Sans/DM Sans, HugeIcons e raio None apenas um ponto de partida.
- Use Supabase para banco, Auth e Storage. Escolha Edge Functions para lógica próxima a dados/autorização Supabase; escolha Cloudflare Workers para lógica de borda, APIs públicas ou integração que se beneficie do ecossistema Cloudflare. Registre a justificativa em ADR quando a escolha for durável.
- Crie um projeto Supabase e um projeto Cloudflare Pages independentes para homologação e produção. Nunca compartilhe banco, usuários, arquivos ou segredos entre eles.
- Prefira os limites gratuitos e sinalize explicitamente qualquer requisito que possa exigir cobrança. Não ative planos pagos, domínios pagos, complementos ou cobranças sem autorização.

## Autenticação

- Comece com e-mail e senha como padrão. Quando houver confirmação de e-mail, recuperação de senha ou magic link, use Resend como SMTP; não ofereça outro provedor salvo pedido explícito.
- Ofereça, quando útil, o login com Google como alternativa opcional. Só guie a configuração de Google Cloud, URL de retorno e credenciais OAuth depois que os dois ambientes e URLs estiverem definidos e o usuário tiver escolhido Google.
- Ofereça a desativação da confirmação de e-mail somente como escolha consciente: explique que alguém poderá se cadastrar sem comprovar que controla aquele endereço e que recuperação de senha continua exigindo SMTP. Se não houver SMTP, desative ou oculte recuperação de senha.
- Não proponha login por telefone, SMS, WhatsApp ou Telegram por padrão. Só os discuta se a pessoa pedir, explicando custos recorrentes, requisitos de provedor e proteção contra abuso.

## Segredos e acessos

- Ao conectar o projeto ao Supabase, sempre ofereça três alternativas: login pela CLI, conexão pelo navegador ou token de acesso pessoal. Explique que o token é útil para uma conexão direta e não interativa; deixe a escolha com o usuário.
- Ofereça como opção real que o agente crie e preencha um arquivo `.env` local não versionado com as configurações de acesso. Após a confirmação específica da pessoa, crie-o e salve nele o token (por exemplo, `SUPABASE_ACCESS_TOKEN`) para a conexão combinada; não insista que a pessoa faça isso manualmente. Confirme antes que `.env` está no `.gitignore`.
- Também ofereça a alternativa de a própria pessoa criar e preencher o `.env`, se ela preferir.
- Antes de receber ou usar um token, senha, segredo SMTP, OAuth secret ou print que o contenha, peça confirmação específica: o valor será usado para qual arquivo/configuração e quais são os riscos de compartilhá-lo nesta conversa.
- Após a autorização, aceite o dado apenas para a ação combinada. Nunca o copie para documentação, exemplos, logs, commits ou mensagens de resumo. Adicione arquivos locais de segredos ao `.gitignore` antes de gravá-los.
- Não exponha tokens, chaves, senhas ou conteúdo de arquivos secretos em comandos, evidências ou saídas. Registre somente “configurado”, “ausente” ou a próxima ação necessária.

## Recursos

- [Entrevista](references/entrevista.md): roteiro de descoberta e critérios de prontidão.
- [Ambientes e autenticação](references/ambientes-e-autenticacao.md): decisões, segurança e configuração esperada.
- `scripts/Test-AppEnvironment.ps1`: checagem segura de pré-requisitos e sessões locais.
