const path = require('path');

module.exports = {
  env: {
    browser: true,
    node: true,
    jquery: true,
    es2021: true,
    jest: true,
  },
  globals: {
    Manon: 'writable',
    Rails: 'readonly',
    updateStatusColor: 'readonly',
    spine: 'writable',
    gantt: 'writable',
    I18n: 'readonly',
    Turbolinks: 'readonly',
    gtag: 'readonly',
    CKEDITOR: 'readonly',
    Sentry: 'readonly',
    // --- TODO: webpack移行後importでのローカルアクセスにして削除すること ---
    pnotify: 'readonly',
    PNotify: 'readonly',
    NProgress: 'readonly',
    videojs: 'readonly',
    Clipboard: 'readonly',
    // ---
  },
  extends: [
    'airbnb-base',
    'eslint:recommended',
    'plugin:vue/vue3-recommended',
    'plugin:storybook/recommended',
    'prettier',
  ],
  parser: 'vue-eslint-parser',
  parserOptions: {
    parser: 'espree',
    ecmaVersion: 2022,
    sourceType: 'module',
  },
  plugins: ['vue'],
  settings: {
    'import/resolver': {
      webpack: {
        config: path.resolve(__dirname, './webpack.config.js'),
      },
    },
  },
  rules: {
    'vue/one-component-per-file': 'off',
    'comma-dangle': 'off',
    'import/no-unresolved': [
      'error',
      {
        ignore: ['^~icons/sp'], // unplugin-iconsで自動生成されるパス
      },
    ],
    'vue/multi-word-component-names': 'off',
  },
};
