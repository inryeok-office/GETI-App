# GETI-App

GETI 서비스의 Flutter 애플리케이션 저장소입니다.

> 개인 취향보다 프로젝트 전체의 일관성을 우선합니다.
> Git Flow, Issue, Pull Request, 라벨 등 공통 협업 규칙은 GETI 저장소 간에 동일하게 유지합니다.

## 기술 스택

- Flutter
- Dart

상태 관리, 네트워크, 라우팅 및 아키텍처 관련 패키지는 팀 합의 후 도입합니다.

## 브랜치 전략

- `main`: 운영 또는 배포가 가능한 안정 버전입니다. 직접 Push하지 않습니다.
- `develop`: 다음 개발 버전을 통합하는 기본 개발 브랜치입니다. 직접 Push하지 않습니다.
- 작업 브랜치는 최신 `develop`에서 분기합니다.
- 모든 변경은 Pull Request와 리뷰를 거쳐 반영합니다.

작업 브랜치는 다음 형식을 사용합니다.

```text
feature/{issue-number}-{short-description}
fix/{issue-number}-{short-description}
refactor/{issue-number}-{short-description}
chore/{issue-number}-{short-description}
docs/{issue-number}-{short-description}
hotfix/{issue-number}-{short-description}
```

예:

```text
feature/12-job-list
fix/24-login-error
chore/1-collaboration-foundation
```

브랜치 이름에는 영문 소문자와 숫자, 하이픈을 사용합니다.

## 협업 절차

1. 작업 전에 적절한 Issue Form으로 GitHub Issue를 생성합니다.
2. Issue의 요구사항, 완료 조건, 우선순위와 작업 범위를 확인합니다.
3. 최신 `develop`을 반영한 뒤 Issue 번호가 포함된 작업 브랜치를 생성합니다.
4. 하나의 명확한 작업 단위로 커밋합니다.
5. `develop`을 대상으로 Pull Request를 생성합니다.
6. PR 본문에 `Closes #{issue-number}`를 작성해 Issue를 연결합니다.
7. 검증 결과를 작성하고 Self Review를 진행합니다.
8. 리뷰어 승인 후 `Squash and merge` 합니다.

### 작업 시작 전 최신 develop 반영

```bash
git switch develop
git pull origin develop
git switch -c feature/12-job-list
```

이미 생성한 작업 브랜치에 최신 `develop`을 반영해야 한다면 다음과 같이 진행합니다.

```bash
git switch feature/12-job-list
git fetch origin
git rebase origin/develop
```

공유 중인 브랜치에서 rebase가 필요한 경우에는 다른 작업자와 먼저 협의합니다.

## Commit Convention

커밋 메시지는 Conventional Commits 형식을 사용하며 작업 내용은 한글로 작성합니다.

```text
<type>: <한글 작업 내용>
```

예:

```text
feat: 공고 목록 화면 추가
fix: 로그인 실패 메시지 표시 오류 수정
refactor: 중복 위젯 생성 로직 분리
test: 로그인 화면 위젯 테스트 추가
docs: 브랜치 전략 문서화
```

기술명, 클래스명, 패키지명 등 고유명사는 영문 표기를 유지할 수 있습니다.

허용 Type:

| Type | 용도 |
| --- | --- |
| `feat` | 새로운 기능 추가 |
| `fix` | 버그 수정 |
| `refactor` | 외부 동작 변화 없는 구조 개선 |
| `style` | 포맷팅 등 동작에 영향을 주지 않는 수정 |
| `test` | 테스트 추가 또는 수정 |
| `docs` | 문서 추가 또는 수정 |
| `chore` | 기타 유지보수 작업 |
| `config` | 앱 및 개발 환경 설정 |
| `build` | 의존성 또는 빌드 설정 변경 |
| `ci` | CI/CD 설정 변경 |
| `perf` | 성능 개선 |
| `revert` | 이전 커밋 되돌리기 |

작성 규칙:

- Type은 영문 소문자로 작성하고 뒤에 콜론과 공백을 붙입니다.
- 제목은 한글로 작성하고 끝에 마침표를 붙이지 않습니다.
- 한 커밋에는 하나의 논리적 변경만 담습니다.
- `수정`, `작업 완료`, `update`, `최종`처럼 변경 내용을 알 수 없는 메시지는 사용하지 않습니다.
- 임시 파일, 디버깅 코드와 비밀 정보는 커밋하지 않습니다.
- Issue 종료는 커밋 메시지가 아닌 PR 본문의 `Closes #번호`로 처리합니다.

## Issue

- Bug, Feature, Refactor, Chore 중 작업에 맞는 Issue Form을 사용합니다.
- 작업 배경과 범위, 완료 조건을 구체적으로 작성합니다.
- 하나의 Issue가 지나치게 크다면 독립적으로 검증 가능한 단위로 나눕니다.
- 유형, 상태, 우선순위, 규모와 영향 영역 라벨을 함께 사용합니다.

## Pull Request

- 대상 브랜치는 기본적으로 `develop`입니다.
- 제목은 `[도메인] 작업 내용` 형식으로 작성합니다.
- 본문에 연관 Issue, 작업 배경, 주요 변경, 검증 결과와 리뷰 참고 사항을 작성합니다.
- UI 변경이 있으면 스크린샷 또는 화면 녹화를 첨부합니다.
- 플랫폼별 결과가 다르면 영향을 받는 각 플랫폼의 결과를 첨부합니다.
- 서로 관련 없는 변경을 하나의 PR에 섞지 않습니다.
- 리뷰어 승인 후 `Squash and merge` 합니다.
- Squash Commit 메시지도 Commit Convention을 따릅니다.

예:

```text
[Job] 공고 목록 화면 구현
[Auth] 로그인 실패 처리 수정
[Chore] Flutter 앱 협업 기반 설정
```

## 검증

변경 범위에 맞는 명령을 실행하고 PR에 결과를 기록합니다.

```bash
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test
```

필요한 경우 Android, iOS, Web 등 영향을 받는 플랫폼에서도 직접 동작을 확인합니다.

## 리뷰

리뷰 의견의 의도를 명확히 하기 위해 다음 표현을 사용할 수 있습니다.

- `[BLOCKER]`: Merge 전에 반드시 해결해야 하는 문제
- `[REQUEST]`: 반영을 요청하는 변경
- `[SUGGESTION]`: 선택적으로 검토할 개선 제안
- `[QUESTION]`: 의도나 구현 내용을 확인하는 질문
- `[PRAISE]`: 좋은 구현이나 결정을 공유하는 의견

의견에는 가능한 한 이유와 대안을 함께 작성합니다.

## 라벨 체계

Issue와 Pull Request는 `{emoji} {label-name}` 형식의 라벨을 사용합니다. 전체 목록은 저장소의 [Labels 페이지](../../labels)에서 확인할 수 있습니다.

### 작업 유형

`✨ feature`, `🐛 bug`, `♻️ refactor`, `⚡ performance`, `🧪 test`, `📝 docs`, `🧹 chore`, `🔧 config`, `🏗️ infrastructure`, `🔒 security`

### 작업 상태

`📋 backlog`, `📝 ready`, `🚧 in progress`, `👀 review`, `🕒 waiting`, `⛔ blocked`

상태 라벨은 Issue에만 적용하며 현재 상태에 맞는 라벨 하나를 사용합니다.

### 우선순위

`🔴 priority: critical`, `🟠 priority: high`, `🟡 priority: medium`, `🟢 priority: low`

Issue 하나에 하나의 우선순위 라벨을 사용합니다.

### 작업 규모

`🪶 size: xs`, `🌱 size: s`, `🌿 size: m`, `🌳 size: l`, `🏔️ size: xl`

Issue 하나에 하나의 규모 라벨을 사용합니다. `size: xl`은 가능한 경우 더 작은 Issue로 분리합니다.

### 영향 영역

`area:` 라벨로 영향을 받는 도메인이나 기술 영역을 표시합니다. 하나의 Issue에 여러 개를 사용할 수 있습니다.

예:

- `🔐 area: auth`
- `💼 area: job`
- `🎨 area: ui`
- `🌐 area: api`
- `🗂️ area: state`
- `🧭 area: routing`
- `📱 area: responsive`
- `🚀 area: deployment`
- `🛠️ area: developer-tools`

### 특별 관리

`🚨 breaking change`, `🔁 duplicate`, `🆘 help wanted`, `🙋 good first issue`, `❓ question`, `🚫 invalid`, `🛑 won't fix`

`done` 라벨은 Issue의 Close 상태와 중복되므로 사용하지 않습니다.
