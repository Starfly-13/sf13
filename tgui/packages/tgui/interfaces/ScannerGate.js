import { useBackend } from '../backend';
import { Box, Button, LabeledList, NumberInput, Section } from '../components';
import { InterfaceLockNoticeBox } from './common/InterfaceLockNoticeBox';
import { Window } from '../layouts';
//------------------------------------------------------------------------------
// STARFLY EDIT - ADDITION BEGIN - SINTA_UNATHI
//------------------------------------------------------------------------------
import { STARFLY13 } from '../starfly';
//------------------------------------------------------------------------------
// STARFLY EDIT - ADDITION END - SINTA_UNATHI
//------------------------------------------------------------------------------

const DISEASE_THEASHOLD_LIST = [
  'Positive',
  'Harmless',
  'Minor',
  'Medium',
  'Harmful',
  'Dangerous',
  'BIOHAZARD',
];

const TARGET_SPECIES_LIST = [
  {
    name: 'Human',
    value: 'human',
  },
  {
//------------------------------------------------------------------------------
// STARFLY EDIT - CHANGE BEGIN - SINTA_UNATHI
//------------------------------------------------------------------------------
    name: (STARFLY13.MODULE_SINTA_UNATHI_ENABLED ? 'Unathi' : 'Sarathi'),
//------------------------------------------------------------------------------
// STARFLY EDIT - CHANGE END - SINTA_UNATHI
//------------------------------------------------------------------------------
    value: 'lizard',
  },
  {
    name: 'Flyperson',
    value: 'fly',
  },
  {
    name: 'Plasmaman',
    value: 'plasma',
  },
  {
    name: 'Mothperson',
    value: 'moth',
  },
  {
    name: 'Jellyperson',
    value: 'jelly',
  },
  {
    name: 'Podperson',
    value: 'pod',
  },
  {
    name: 'Golem',
    value: 'golem',
  },
  {
    name: 'Zombie',
    value: 'zombie',
  },
  {
    name: 'Rachnid',
    value: 'rachnid',
  },
  {
    name: 'IPC',
    value: 'ipc',
  },
  {
    name: 'Elzuose',
    value: 'ethereal',
  },
  {
    name: 'Kepori',
    value: 'kepori',
  },
];

export const ScannerGate = (props, context) => {
  const { act, data } = useBackend(context);
  return (
    <Window width={400} height={300} resizable>
      <Window.Content scrollable>
        <InterfaceLockNoticeBox
          onLockedStatusChange={() => act('toggle_lock')}
        />
        {!data.locked && <ScannerGateControl />}
      </Window.Content>
    </Window>
  );
};

const SCANNER_GATE_ROUTES = {
  Off: {
    title: 'Scanner Mode: Off',
    component: () => ScannerGateOff,
  },
  Wanted: {
    title: 'Scanner Mode: Wanted',
    component: () => ScannerGateWanted,
  },
  Guns: {
    title: 'Scanner Mode: Guns',
    component: () => ScannerGateGuns,
  },
  Mindshield: {
    title: 'Scanner Mode: Mindshield',
    component: () => ScannerGateMindshield,
  },
  Disease: {
    title: 'Scanner Mode: Disease',
    component: () => ScannerGateDisease,
  },
  Species: {
    title: 'Scanner Mode: Species',
    component: () => ScannerGateSpecies,
  },
  Nanites: {
    title: 'Scanner Mode: Nanites',
    component: () => ScannerGateNanites,
  },
};

const ScannerGateControl = (props, context) => {
  const { act, data } = useBackend(context);
  const { scan_mode } = data;
  const route = SCANNER_GATE_ROUTES[scan_mode] || SCANNER_GATE_ROUTES.off;
  const Component = route.component();
  return (
    <Section
      title={route.title}
      buttons={
        scan_mode !== 'Off' && (
          <Button
            icon="arrow-left"
            content="back"
            onClick={() => act('set_mode', { new_mode: 'Off' })}
          />
        )
      }
    >
      <Component />
    </Section>
  );
};

const ScannerGateOff = (props, context) => {
  const { act } = useBackend(context);
  return (
    <>
      <Box mb={2}>Select a scanning mode below.</Box>
      <Box>
        <Button
          content="Wanted"
          onClick={() => act('set_mode', { new_mode: 'Wanted' })}
        />
        <Button
          content="Guns"
          onClick={() => act('set_mode', { new_mode: 'Guns' })}
        />
        <Button
          content="Mindshield"
          onClick={() => act('set_mode', { new_mode: 'Mindshield' })}
        />
        <Button
          content="Disease"
          onClick={() => act('set_mode', { new_mode: 'Disease' })}
        />
        <Button
          content="Species"
          onClick={() => act('set_mode', { new_mode: 'Species' })}
        />
        <Button
          content="Nanites"
          onClick={() => act('set_mode', { new_mode: 'Nanites' })}
        />
      </Box>
    </>
  );
};

const ScannerGateWanted = (props, context) => {
  const { data } = useBackend(context);
  const { reverse } = data;
  return (
    <>
      <Box mb={2}>
        Trigger if the person scanned {reverse ? 'does not have' : 'has'} any
        warrants for their arrest.
      </Box>
      <ScannerGateMode />
    </>
  );
};

const ScannerGateGuns = (props, context) => {
  const { data } = useBackend(context);
  const { reverse } = data;
  return (
    <>
      <Box mb={2}>
        Trigger if the person scanned {reverse ? 'does not have' : 'has'} any
        guns.
      </Box>
      <ScannerGateMode />
    </>
  );
};

const ScannerGateMindshield = (props, context) => {
  const { data } = useBackend(context);
  const { reverse } = data;
  return (
    <>
      <Box mb={2}>
        Trigger if the person scanned {reverse ? 'does not have' : 'has'} a
        mindshield.
      </Box>
      <ScannerGateMode />
    </>
  );
};

const ScannerGateDisease = (props, context) => {
  const { act, data } = useBackend(context);
  const { reverse, disease_threshold } = data;
  return (
    <>
      <Box mb={2}>
        Trigger if the person scanned {reverse ? 'does not have' : 'has'} a
        disease equal or worse than {disease_threshold}.
      </Box>
      <Box mb={2}>
        {DISEASE_THEASHOLD_LIST.map((threshold) => (
          <Button.Checkbox
            key={threshold}
            checked={threshold === disease_threshold}
            content={threshold}
            onClick={() =>
              act('set_disease_threshold', {
                new_threshold: threshold,
              })
            }
          />
        ))}
      </Box>
      <ScannerGateMode />
    </>
  );
};

const ScannerGateSpecies = (props, context) => {
  const { act, data } = useBackend(context);
  const { reverse, target_species } = data;
  const species = TARGET_SPECIES_LIST.find((species) => {
    return species.value === target_species;
  });
  return (
    <>
      <Box mb={2}>
        Trigger if the person scanned is {reverse ? 'not' : ''} of the{' '}
        {species.name} species.
        {target_species === 'zombie' &&
          ' All zombie types will be detected, including dormant zombies.'}
      </Box>
      <Box mb={2}>
        {TARGET_SPECIES_LIST.map((species) => (
          <Button.Checkbox
            key={species.value}
            checked={species.value === target_species}
            content={species.name}
            onClick={() =>
              act('set_target_species', {
                new_species: species.value,
              })
            }
          />
        ))}
      </Box>
      <ScannerGateMode />
    </>
  );
};

const ScannerGateNanites = (props, context) => {
  const { act, data } = useBackend(context);
  const { reverse, nanite_cloud } = data;
  return (
    <>
      <Box mb={2}>
        Trigger if the person scanned {reverse ? 'does not have' : 'has'} nanite
        cloud {nanite_cloud}.
      </Box>
      <Box mb={2}>
        <LabeledList>
          <LabeledList.Item label="Cloud ID">
            <NumberInput
              value={nanite_cloud}
              width="65px"
              minValue={1}
              maxValue={100}
              stepPixelSize={2}
              onChange={(e, value) =>
                act('set_nanite_cloud', {
                  new_cloud: value,
                })
              }
            />
          </LabeledList.Item>
        </LabeledList>
      </Box>
      <ScannerGateMode />
    </>
  );
};

const ScannerGateMode = (props, context) => {
  const { act, data } = useBackend(context);
  const { reverse } = data;
  return (
    <LabeledList>
      <LabeledList.Item label="Scanning Mode">
        <Button
          content={reverse ? 'Inverted' : 'Default'}
          icon={reverse ? 'random' : 'long-arrow-alt-right'}
          onClick={() => act('toggle_reverse')}
          color={reverse ? 'bad' : 'good'}
        />
      </LabeledList.Item>
    </LabeledList>
  );
};
