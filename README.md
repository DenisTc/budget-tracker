# Budget Tracker
<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/b34e2673-0f47-40e4-8d31-ebb7251a7b7c" width=270></td>
    <td>Budget Tracker - это мобильное приложение на Flutter для управления личными финансами, позволяющее отслеживать доходы, расходы и просматривать статистику.</td>
  </tr>
</table>

[Скачать APK](https://drive.google.com/file/d/1uqtdFCq43_mTlaz-7kHwEKbhABmfegWA/view?usp=sharing)


## Скриншоты
<table>
  <tr>
    <td>Главный экран(пустой)</td>
    <td>Главный экран(с транзакциями)</td>
    <td>Главный экран(с вкл. фильтрами)</td>
    <td>Экран фильтров транзакций</td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/0cda6817-d6c0-4806-bca6-1aa42aa85a16" width=270></td>
    <td><img src="https://github.com/user-attachments/assets/e71304d2-5db5-476d-935d-5cf8cef99daa" width=270></td>
    <td><img src="https://github.com/user-attachments/assets/7c148c55-4c4a-4155-ab97-77c576510758" width=270></td>
    <td><img src="https://github.com/user-attachments/assets/f0731766-e41f-41cb-98bd-02bfb8bb854a" width=270></td>
  </tr>
  <tr>
    <td>Удаление транзакции</td>
    <td>Добавление новой транзакции</td>
    <td>Выбор категории</td>
    <td>Экран статистики(пустой)</td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/657d5c19-e8bc-4cc9-91ac-171c85ede6b3" width=270></td>
    <td><img src="https://github.com/user-attachments/assets/d56ac8eb-93b1-4269-8f94-1be58c980153" width=270></td>
    <td><img src="https://github.com/user-attachments/assets/76e33841-e226-4862-9e29-3dfea2d97d2e" width=270></td>
    <td><img src="https://github.com/user-attachments/assets/f6de3aba-f56b-4faf-9c01-cb3d033d38b5" width=270></td>
  </tr>
<tr>
    <td>Экран статистики 1/2</td>
    <td>Экран статистики 2/2</td>
  </tr>
<tr>
    <td><img src="https://github.com/user-attachments/assets/8fcb5f68-5d1c-4369-a820-0436ab3f4329" width=270></td>
    <td><img src="https://github.com/user-attachments/assets/bf56ce72-29ee-4736-8229-3f561cc042c7" width=270></td>
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
