# Budget Tracker
<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/b34e2673-0f47-40e4-8d31-ebb7251a7b7c" width=270></td>
    <td>Budget Tracker - это мобильное приложение на Flutter для управления личными финансами, позволяющее отслеживать доходы, расходы и просматривать статистику.</td>
  </tr>
</table>

## Требования

- **Flutter SDK**: 3.24.4
- **Dart SDK**: 3.5.4

## Запуск проекта

1. Убедитесь, что у вас установлен Flutter SDK версии 3.24.4 и Dart SDK версии 3.5.4.
2. Установите зависимости, выполнив команду:
   ```bash
   flutter pub get
   ```
3. Сгенерируйте необходимые файлы:
    ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. Запустите проект на эмуляторе или подключенном устройстве:
   ```bash
   flutter run
   ```
## Используемые плагины

### Database
- `drift: ^2.21.0`
- `drift_flutter: ^0.2.0`
- `path_provider: ^2.1.5`

### State Management
- `flutter_bloc: ^8.1.6`
- `bloc: ^8.1.4`
- `provider: ^6.1.2`

### DI
- `get_it: ^8.0.2`
- `injectable: ^2.5.0`
- `injectable_generator: ^2.6.2`

### UI
- `syncfusion_flutter_charts: ^27.1.57`
- `carousel_slider: ^5.0.0`

### Other
- `equatable: ^2.0.5 `

### Codegen
- `drift_dev: ^2.20.1`
- `injectable_generator: ^2.6.2`
- `build_runner: ^2.4.12`



## Структура проекта

```markdown
lib/
└── src/
    ├── core/
    │   ├── constant/
    │   ├── database/
    │   ├── di/
    │   ├── enums/
    │   ├── extension/
    │   ├── localization/
    │   ├── theme/
    ├── feature/
    │   ├── category/
    │   │   ├── data/
    │   │   │   ├── datasource/
    │   │   │   ├── models/
    │   │   │   └── repos/
    │   │   ├── domain/
    │   │   │   ├── entities/
    │   │   │   ├── repos/
    │   │   │   └── usecases/
    │   │   └── presentation/
    │   │       └── cubit/
    │   ├── category_list/
    │   │   └── presentation/
    │   │       └── cubit/
    │   ├── dashboard/
    │   ├── statistics/
    │   │   ├── data/
    │   │   │   └── models/
    │   │   ├── utils/
    │   │   └── widgets/
    │   └── transaction/
    │       ├── data/
    │       │   ├── datasource/
    │       │   ├── models/
    │       │   └── repos/
    │       ├── domain/
    │       │   ├── entities/
    │       │   ├── repos/
    │       │   └── usecases/
    │       ├── presentation/
    │       │   ├── cubit/
    │       │   └── widgets/
    │       ├── transaction_list/
    │       │   └── presentation/
    │       │       ├── cubit/
    │       │       └── widgets/
    └── main.dart
