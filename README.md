# Gestor Escolar

## Descrição

Gestor Escolar é um aplicativo iOS desenvolvido em Swift, utilizando UIKit, que segue a arquitetura MVP (Model-View-Presenter). O projeto incorpora vários padrões de design, como Delegate, Coordinator, Adapter e POP (Programação Orientada a Protocolo), e adere aos princípios SOLID para obter um código limpo, modular e reutilizável.

## Arquitetura MVP

O projeto utiliza a arquitetura MVP para separar as responsabilidades entre as camadas de modelo, visão e apresentador. Isso permite uma melhor organização do código e facilita a manutenção e teste das funcionalidades.

## Padrões de Design

### Delegate

O padrão Delegate é utilizado para estabelecer uma comunicação entre componentes, permitindo que um objeto delegue determinadas tarefas para outro objeto.

### Coordinator

O padrão Coordinator é utilizado para gerenciar a navegação e fluxo do aplicativo. Ele separa a lógica de navegação da lógica de apresentação, tornando o código mais modular e facilitando a adição de novas telas e fluxos.

### Adapter

O padrão Adapter é utilizado para adaptar interfaces incompatíveis entre diferentes classes ou componentes. Ele permite a interoperabilidade entre diferentes partes do código, garantindo a coesão e o baixo acoplamento.

### POP (Programação Orientada a Protocolo)

A Programação Orientada a Protocolo é utilizada para definir comportamentos comuns através de protocolos, permitindo que objetos de diferentes tipos compartilhem a mesma interface. Isso promove a reutilização de código e facilita a extensibilidade.

