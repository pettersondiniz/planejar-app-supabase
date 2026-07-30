# Entrevista e prontidão

## Ordem sugerida

Faça apenas perguntas que mudem o plano. Preserve linguagem cotidiana.

1. **Produto:** o que será resolvido, para quem e qual é a primeira tarefa que uma pessoa precisa concluir?
2. **Fluxos:** quais são as três ações mais importantes; quem pode fazer cada uma; o que acontece quando falta informação ou ocorre erro?
3. **Dados:** o que será guardado, quem vê/altera cada item e se há anexos. Use Supabase Storage apenas para arquivos.
4. **Acesso:** haverá conta? Use e-mail como padrão. Pergunte sobre confirmação, recuperação de senha e Google somente se fizerem sentido.
5. **Interface:** pergunte por referências, estilo shadcn, telas necessárias, celular/computador e tema padrão.
6. **Operação:** nomes desejados para app, homologação e produção; domínio se houver; quem testará e que dados de teste serão usados.

## Regras para documentação incremental

Assim que houver objetivo, fluxo e dados suficientes, registre-os em `spec.md`, com critérios observáveis e perguntas abertas. Atualize `plan.md` ao decidir uma abordagem, dependência ou ordem de entrega. Atualize `status.md` ao terminar uma fase, encontrar bloqueio ou mudar a próxima ação.

Para uma decisão de arquitetura que não deve ser rediscutida a cada tarefa, crie uma ADR curta. Casos típicos: ambientes isolados, estratégia de autenticação, função Supabase versus Worker e modelo de permissões.

Depois de cada alteração de documentação, revise `git status`, confirme que não há segredo rastreado e crie um commit. Não faça commit vazio.

## Critério de prontidão para começar

Considere a primeira versão pronta para desenvolvimento quando houver:

- objetivo e público definidos;
- fluxo principal e critérios de sucesso definidos;
- entidades/dados principais e permissões iniciais definidos;
- decisão de autenticação e consequências registradas;
- tema padrão e direção visual definidos;
- nomes e isolamento de homologação/produção definidos;
- acesso e ferramentas em estado pronto, ou bloqueios registrados;
- milestones AISDD que possam ser implementados sem decisões de produto pendentes.

Então apresente um resumo curto e ofereça explicitamente começar o desenvolvimento. Se o usuário não autorizar, continue refinando e atualizando a documentação.
