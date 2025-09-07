import type {SidebarsConfig} from '@docusaurus/plugin-content-docs';

// This runs in Node.js - Don't use client-side code here (browser APIs, JSX...)

/**
 * Creating a sidebar enables you to:
 - create an ordered group of docs
 - render a sidebar for each doc of that group
 - provide next/previous navigation

 The sidebars can be generated from the filesystem, or explicitly defined here.

 Create as many sidebars as you want.
 */
const sidebars: SidebarsConfig = {
  // Custom sidebar structure for Alphasow UI documentation
  tutorialSidebar: [
    'intro',
    {
      type: 'category',
      label: 'Components',
      items: [
        'components/overview',
        {
          type: 'category',
          label: 'Buttons',
          items: [
            'components/buttons/as-button',
            'components/buttons/as-icon-button',
            'components/buttons/as-link-button',
          ],
        },
        {
          type: 'category',
          label: 'Forms',
          items: [
            'components/forms/as-text-field',
            'components/forms/as-checkbox',
          ],
        },
        {
          type: 'category',
          label: 'Alerts',
          items: [
            'components/alerts/as-alert-banner',
            'components/alerts/as-alert-dialog',
            'components/alerts/as-bottom-sheet',
            'components/alerts/banner-system',
          ],
        },
        {
          type: 'category',
          label: 'Layout',
          items: [
            'components/layout/as-scaffold',
            'components/layout/as-app-bar',
          ],
        },
        {
          type: 'category',
          label: 'Loaders',
          items: [
            'components/loaders/as-loading-spinner',
            'components/loaders/as-loading-circular',
          ],
        },
      ],
    },
    {
      type: 'category',
      label: 'Guides',
      items: [
        'guides/quick-start',
      ],
    },
  ],
};

export default sidebars;
