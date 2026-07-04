# React Native And Expo Repo Context

## Common Profiles

Expo with React Navigation profile:

- Expo/React Native with React Navigation.
- Source layout: `app/screens`, `app/navigation`, `app/providers`, `services`, `shared`.
- Screen slices commonly use `screen`, `ui`, and `lib`.
- API/auth/query infrastructure lives in `services`.
- Shared UI/config/constants/lib/types live in root `shared`.
- Aliases include `@app`, `@assets`, `@shared`, `@config`, `@components`, and `@services`.

Expo Router profile:

- Expo/React Native with Expo Router typed routes and NativeWind.
- Source layout: `app`, `bootstrap`, `features`, `widgets`, `shared`, `assets`.
- Route files live under `app`, including groups like `(stack)` and `(tabs)`.
- App providers and runtime effects live under `bootstrap`.
- Feature slices use `ui`, `lib`, `model`, `domain`, `platform`, `storage`, or `sync` when needed.
- Aliases include `@`, `@app`, `@assets`, `@shared`, `@api`, `@lib`, and `@components`.

## Mobile Rules

- Do not treat `app` the same in every repo. In React Navigation projects it contains screens/navigation/providers; in Expo Router projects it contains file-based routes.
- Keep Expo Router route files thin. Compose feature or widget UI from route files.
- Keep React Navigation route constants and param lists centralized where the repo already stores them.
- Keep native permissions, app identity, schemes, plugins, and build properties in `app.config.*` or native config files.
- Avoid editing `ios/` or `android/` unless the task explicitly requires native changes or prebuild output.
- Keep platform-specific health, storage, background, notification, and permissions code in the existing platform/service layer.
- Prefer shared UI primitives from `shared/ui`; keep screen-specific styling and composition close to the screen or feature.

## Common Scripts

Inspect `package.json` first, then prefer these patterns:

- JavaScript-only changes: `typecheck` and `lint`.
- Formatting-only checks: `format:check`.
- Expo/native config/dependency changes: `expo:doctor` and `expo:install-check`.
- React Compiler-sensitive changes: `react:compiler:healthcheck`.
- Platform smoke checks: `ios` or `android` only when the task affects native behavior and the environment is available.

## Skill Routing

- Use `vercel-react-native-skills` for Expo/React Native components, navigation, lists, animations, native modules, or mobile performance.
- Use `tanstack-query-best-practices` for queries, mutations, invalidation, and cache behavior.
- Use `security-review` when touching auth, Firebase, secure storage, app config secrets, uploads, health permissions, or local persistence.
