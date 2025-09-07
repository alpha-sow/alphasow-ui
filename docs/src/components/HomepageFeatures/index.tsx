import type {ReactNode} from 'react';
import clsx from 'clsx';
import Heading from '@theme/Heading';
import styles from './styles.module.css';

type FeatureItem = {
  title: string;
  description: ReactNode;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Platform Adaptive',
    description: (
      <>
        Components automatically adapt between Material Design (Android) and
        Cupertino (iOS) styling based on the current platform.
      </>
    ),
  },
  {
    title: 'Consistent Theming',
    description: (
      <>
        Built-in theming system with dark/light mode support and customizable
        color schemes that work seamlessly across all components.
      </>
    ),
  },
  {
    title: 'Rich Component Library',
    description: (
      <>
        Comprehensive collection of UI components including buttons, forms,
        alerts, loaders, menus, and navigation with built-in accessibility.
      </>
    ),
  },
];

function Feature({title, description}: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): ReactNode {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
