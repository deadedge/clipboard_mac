# Flutter Clipboard Manager

Um aplicativo Flutter para macOS que gerencia e armazena todo o conteúdo do seu clipboard, incluindo texto, imagens e arquivos.

## 📋 Visão Geral

Este aplicativo monitora seu clipboard e guarda automaticamente tudo o que é copiado, criando um histórico completo dos seus conteúdos. Perfeito para profissionais que trabalham com múltiplos tipos de conteúdo e precisam acessar rapidamente itens copiados anteriormente.

## ✨ Funcionalidades

- **Armazenamento universal do clipboard**: Guarda automaticamente tudo o que é copiado para o clipboard
- **Suporte a múltiplos formatos**:
  - Texto: Qualquer conteúdo textual
  - Imagens: Suporte para PNG, JPG, JPEG e GIF
  - Arquivos: Nomes e referências de arquivos copiados
- **Visualização rica**: 
  - Imagens são exibidas diretamente na interface
  - Arquivos são mostrados com ícone e nome
- **Gerenciamento de registros**:
  - Possibilidade de eliminar itens específicos do histórico
  - Interface intuitiva para gerenciar seu histórico de clipboard
- **Multilíngue**:
  - Suporte completo para múltiplos idiomas
  - Atualmente disponível em Português (PT) e Inglês (EN)
- **Acesso rápido**: Use `Ctrl + V` para abrir o aplicativo

## 🖼️ Capturas de Tela

<img width="379" alt="Captura de ecrã 2025-03-14, às 23 00 58" src="https://github.com/user-attachments/assets/c81f7026-350f-468f-8b10-1905bf2a9846" />


## 💻 Requisitos

- macOS (exclusivo para esta plataforma)
- Flutter SDK instalado

## 🚀 Instalação

1. Clone este repositório:
```bash
git clone https://github.com/seu-usuario/flutter-clipboard-manager.git
```

2. Navegue até o diretório do projeto:
```bash
cd flutter-clipboard-manager
```

3. Obtenha as dependências:
```bash
flutter pub get
```

4. Execute o aplicativo (somente macOS):
```bash
flutter run -d macos
```

## 🔍 Como Usar

1. O aplicativo monitora automaticamente seu clipboard
2. Pressione `Ctrl + V` para abrir a interface
3. Navegue pelo histórico de itens copiados
4. Clique em qualquer item para colocá-lo de volta no clipboard
   - Para texto: O texto será copiado
   - Para imagens: A imagem será copiada
   - Para arquivos: A referência do arquivo será copiada
5. Para eliminar um registro do histórico:
   - Clique com o botao direito do mouse para abrir o menu de contexto e eliminar
     
## 🛠️ Tecnologias Utilizadas

Arquitetura: MVVM (Model-View-ViewModel) - a arquitetura recomendada para projetos Flutter
Flutter & Dart
Bibliotecas principais:

pasteboard:  - Manipulação avançada do clipboard para acesso a múltiplos formatos de dados
clipboard_watcher:  - Monitoramento em tempo real de alterações no clipboard
system_tray:  - Integração com a bandeja do sistema para acesso rápido
window_manager:  - Gerenciamento da janela do aplicativo no macOS
hotkey_manager:  - Captura de atalhos de teclado para abertura rápida
provider:  - Gerenciamento de estado seguindo o padrão MVVM
shared_preferences:  - Persistência de dados para histórico de clipboard

## 🤝 Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir um issue ou enviar um pull request.

## 📄 Licença

MIT License

Copyright (c) 2025 João Rodrigues

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
