# Pizza das Mulheres - Aplicativo de Proteção à Vítima de Violência (ODS 5)

* **Disciplina:** Programação para Dispositivos Móveis - Turma B (0925)
* **Professor:** Prof. Dr. Romes Heriberto
* **Modalidade:** Individual
* **Link:** https://pizzadas-mulheres-r0ues4.flutterflow.app/

## 1. Tema e Vinculação aos ODS
Este projeto está vinculado ao **ODS 5: Igualdade de Gênero**.
* **Meta 5.2:** Eliminar todas as formas de violência contra todas as mulheres e meninas nas esferas públicas e privadas.
* **Meta 16.1 (ODS 16):** Reduzir significativamente todas as formas de violência.

## 2. Descrição do Problema
Muitas mulheres vítimas de violência doméstica vivem sob vigilância constante de seus agressores, o que as impede de realizar denúncias ou pedir socorro através de canais convencionais (ligações explícitas para o 190 ou mensagens de texto visíveis). A falta de um canal discreto e camuflado pode resultar na continuidade da violência ou em tragédias evitáveis.

## 3. Justificativa
O desenvolvimento de um aplicativo *stealth* (camuflado) utiliza a tecnologia móvel para criar uma camada de proteção. Ao disfarçar a interface de emergência como um aplicativo de delivery de pizza, garantimos a segurança da vítima caso o agressor verifique o celular. O app aplica conceitos de **Engenharia Social** e **UX/UI** para segurança, além de integrar hardware (GPS e Discador) para resposta rápida, atendendo aos critérios de qualidade da ISO/IEC 25010 (Segurança e Usabilidade).

## 4. Público-Alvo
Mulheres em situação de vulnerabilidade ou risco de violência doméstica que necessitam de uma ferramenta discreta para pedir ajuda ou acessar informações sobre seus direitos sem levantar suspeitas.

## 5. Objetivos do App
1.  **Camuflagem:** Prover uma interface funcional de pizzaria que não levante suspeitas.
2.  **Botão de Pânico:** Permitir o acionamento da Polícia (180) ou Rede de Apoio (WhatsApp) de forma rápida através de gestos específicos (segurar botão).
3.  **Geolocalização:** Capturar e enviar a localização exata da vítima automaticamente.
4.  **Educação:** Fornecer informações sobre a Lei Maria da Penha e medidas protetivas em uma área oculta do app.

## 6. Tipo de Aplicação
**Aplicativo Híbrido / Cross-Platform**.
Desenvolvido utilizando **FlutterFlow** (baseado em Flutter), permitindo a exportação tanto para Android quanto para iOS com uma única base de código.

## 7. Funcionalidades (MVP)
* **Home Page "Fake":** Cardápio de pizzas funcional (visual) com mensagens de duplo sentido sobre acolhimento e segurança.
* **Fluxo de Pedido:** Simulação de carrinho de compras.
* **Gatilho de Emergência:** Na tela "Finalizar Pedido", o botão "Fazer Pedido" possui uma ação de *Long Press* (segurar) que dispara o protocolo de segurança.
* **Protocolo SOS:**
    1.  Captura silenciosa do GPS.
    2.  Tentativa prioritária de discagem automática para o 180.
    3.  Envio de mensagem pré-formatada via WhatsApp com localização para contato de emergência (caso a ligação falhe).
    4.  Feedback visual falso ("Erro no pedido") para manter o disfarce.
* **Área Educativa:** Acesso oculto a informações sobre direitos da mulher e telefones úteis (180, 190).

## 8. Instruções de Instalação e Uso
1.  Baixe o arquivo `.apk` fornecido ou acesse o link da versão Web (PWA) em um dispositivo móvel.
2.  Ao abrir, o app se comporta como uma pizzaria.
3.  **Para testar o SOS:**
    * Adicione uma pizza ao carrinho.
    * Vá para "Finalizar Pedido".
    * **Segure** o botão "Segure para Fazer o Pedido" por alguns segundos.
    * O app tentará abrir o discador (180) ou o WhatsApp com a mensagem de socorro.
4.  **Para acessar a área de Direitos:**
    * Na Home, clique no banner promocional "Por que escolher a Pizzaria da Mulher?".

## 9. Requisitos do Sistema
* **Android:** Versão 6.0 ou superior.
* **iOS:** Versão 12.0 ou superior.
* **Permissões:** É necessário conceder permissão de **Localização (GPS)** e **Telefone** para que as funções de emergência operem corretamente.

---
**Desenvolvido por:** Frederico Martins Engel
