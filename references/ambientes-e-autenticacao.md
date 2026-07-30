# Ambientes, autenticação e custos

## Dois ambientes isolados

Mantenha sempre dois projetos Supabase e dois projetos Cloudflare Pages: homologação e produção. Cada front-end aponta somente para o Supabase do mesmo ambiente.

- Homologação usa usuários, dados, arquivos, URLs e credenciais de teste.
- Produção usa dados e credenciais reais.
- Em cada entrega, aplique todas as migrations pendentes primeiro em homologação e publique a versão correspondente do front-end no Cloudflare Pages de homologação. Não altere migration já aplicada; corrija com nova migration.
- Mantenha comandos ou scripts que validem o projeto de destino antes de aplicar migration ou publicar.
- Publicações devem ser explícitas para o projeto correto. A publicação de homologação não pode substituir produção.

No plano gratuito, projetos Supabase podem pausar por inatividade. Registre isso como limitação operacional e teste a reativação antes de uma demonstração.

## E-mail e Resend

Para confirmação, magic link, convite ou recuperação de senha, configure SMTP no Supabase usando Resend. Use remetentes, domínio e credenciais separados por ambiente quando o projeto estiver em uso real.

Antes de configurar, confirme que a pessoa entende a necessidade de domínio e de registros SPF, DKIM e DMARC para melhor entrega. Segredos SMTP são secretos e nunca entram no repositório.

Se confirmação de e-mail estiver desligada, registre a decisão e os riscos. O cadastro e senha podem funcionar sem SMTP, mas recuperação de senha não deve aparecer sem um serviço de e-mail configurado.

## Google

Para Google, crie credenciais OAuth distintas para homologação e produção, pois cada ambiente tem URL e retorno Supabase próprios. Só faça isso quando URLs e nomes finais estiverem confirmados. Guarde o client secret fora do Git.

## Segurança mínima

- Ative RLS em tabelas expostas e escreva políticas baseadas no usuário autenticado.
- Não coloque service-role key, segredo OAuth, SMTP ou token administrativo no front-end.
- Use variáveis públicas apenas para URL Supabase e chave publishable/anon.
- Defina URLs permitidas de retorno do Auth para localhost, homologação e produção conforme cada ambiente.
- Para qualquer serviço de envio ou login opcional, limite tentativas e use CAPTCHA quando houver risco de abuso.
