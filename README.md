# Real Size Measure

Uma biblioteca de widgets para Flutter projetada para medir distâncias reais (em milímetros) diretamente em imagens de radiografias periapicais na odontologia.

**Nota:** Esta biblioteca não foi publicada no [pub.dev](https://pub.dev) e deve ser instalada diretamente do GitHub.

##  Recursos

-   **Medição Calibrada:** Use uma medida de referência na imagem para calcular o tamanho real de outros objetos em milímetros.
-   **Interface de Toque:** Adicione pontos de medição de forma intuitiva com gestos de toque.
-   **Feedback Visual:** As linhas e os pontos de medição são desenhados diretamente sobre a imagem.
-   **Limpeza Fácil:** Funções para limpar os pontos atuais ou reiniciar a sessão de medição.


##  Instalação

Como o pacote não está no pub.dev, adicione-o ao seu arquivo `pubspec.yaml` referenciando o repositório do GitHub:

```yaml
dependencies:
  flutter:
    sdk: flutter
  real_size_measure:
    git:
      url: https://github.com/Arthurlima544/real_size_measure.git
      # Você pode travar em um commit ou branch específico usando 'ref'
      # ref: main
```

Após adicionar as dependências basta executar:

```Bash
flutter pub get
```

## Uso

O exemplo abaixo demonstra como configurar o widget Measure e interagir com ele através de botões para adicionar, salvar e remover pontos de medição.

Primeiro, envolva o widget Measure com um BlocProvider para gerenciar seu estado. Em seguida, use os métodos expostos pelo widget para controlar as medições.

```Dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_size_measure/real_size_measure.dart';

void main(List<String> args) {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // Instância do widget principal de medição
  final Measure measureWidget = const Measure(
    pointSize: Size(20, 20),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BlocProvider(
          create: (context) => realSizeMeasureBloc,
          child: measureWidget,
        ),
        // Botões para controlar as ações de medição
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Salva os pontos atuais
            FloatingActionButton(
              onPressed: () {
                measureWidget.savePoints(
                  Offset(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height,
                  ),
                );
              },
              child: const Icon(Icons.save),
            ),
            // Adiciona um novo ponto no centro da tela
            FloatingActionButton(
              onPressed: () {
                measureWidget.addNewPoint(
                  CustomPoint(
                    pointOffset: Offset(
                      MediaQuery.of(context).size.width / 2,
                      MediaQuery.of(context).size.height / 2,
                    ),
                  ),
                  pointLimit: 4,
                );
              },
              child: const Icon(Icons.add),
            ),
            // Remove o último ponto adicionado (desfazer)
            FloatingActionButton(
              onPressed: () {
                measureWidget.clearLastPoint();
              },
              child: const Icon(Icons.undo),
            ),
            // Limpa todos os pontos da tela
            FloatingActionButton(
              onPressed: () {
                measureWidget.clearAllPoints();
              },
              child: const Icon(Icons.clear),
            ),
          ],
        ),
      ),
    );
  }
}
```
