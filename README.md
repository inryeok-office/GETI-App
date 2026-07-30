# GETI-App

GETI 서비스의 Flutter 애플리케이션입니다.

## 기술 스택

| 구분 | 기술 |
| --- | --- |
| State | Riverpod |
| Network | Dio, Retrofit |
| Codegen | Freezed, build_runner, json_serializable |
| Storage | flutter_secure_storage, shared_preferences |
| Route | go_router |
| UI | flutter_screenutil, responsive_framework |
| Architecture | Clean Architecture + MVVM |

## 프로젝트 구조

```text
lib/
├── app/                    # 앱 최상위 위젯과 전역 라우터
├── core/
│   ├── config/             # 빌드 환경 설정
│   ├── network/            # Dio와 Retrofit 공통 기반
│   └── storage/            # 보안·일반 로컬 저장소
├── features/               # 기능 단위 코드
├── shared/                 # 여러 기능에서 공유하는 UI와 유틸리티
└── main.dart               # ProviderScope를 적용하는 앱 진입점
```

새 기능은 다음 구조를 기준으로 작성합니다.

```text
features/{feature-name}/
├── data/                   # DTO, DataSource, Repository 구현
├── domain/                 # Entity, Repository 인터페이스, Use Case
└── presentation/
    ├── view/               # Widget과 화면
    └── view_model/         # Riverpod 기반 화면 상태와 동작
```

모든 계층을 미리 만들지 않습니다. 단순 UI처럼 `data` 또는 `domain`이 필요
없는 기능은 사용하는 계층만 추가합니다. 기능 전용 코드는 해당 기능 안에
두고, 두 개 이상의 기능에서 실제로 공유할 때만 `core`나 `shared`로 올립니다.

## 패키지 설치

```bash
flutter pub get
```

패키지를 추가하거나 변경할 때는 팀과 먼저 합의하고 `pubspec.yaml`과
`pubspec.lock`을 함께 반영합니다.

## 코드 생성

Riverpod, Retrofit, Freezed와 JSON 직렬화 코드는 build_runner로 생성합니다.

```bash
dart run build_runner build --delete-conflicting-outputs
```

개발 중 변경 사항을 계속 반영하려면 다음 명령을 사용할 수 있습니다.

```bash
dart run build_runner watch --delete-conflicting-outputs
```

생성된 `.g.dart`, `.freezed.dart` 파일은 저장소에 포함합니다. 생성 파일은
직접 수정하지 않습니다.

## 앱 실행

```bash
flutter run
```

API 주소가 필요한 실행에서는 `API_BASE_URL`을 컴파일 타임 환경변수로
전달합니다.

```bash
flutter run --dart-define=API_BASE_URL=https://api.example.com
```

실제 API 주소와 Secret은 코드에 작성하지 않습니다. `API_BASE_URL`이 비어
있어도 API를 사용하지 않는 기본 화면은 실행할 수 있지만, `RestClient`를
사용하려고 하면 설정 누락을 알리는 `StateError`가 발생합니다.

## 로컬 저장소

- Access Token, Refresh Token 등 민감한 값은 `flutter_secure_storage`를
  사용합니다.
- 테마, 온보딩 확인 여부 등 노출되어도 보안 문제가 없는 일반 설정은
  `shared_preferences`를 사용합니다.
- 실제 토큰이나 사용자 데이터는 코드, 테스트, 문서에 작성하지 않습니다.

## 검증

```bash
dart format .
flutter analyze
flutter test
```

패키지 또는 코드 생성 설정을 변경했다면 검증 전에 `flutter pub get`과
build_runner를 먼저 실행합니다.
