## What's included ⚡

- SvelteKit app
  - Auto-generated and fully-typed ABIs using wagmi-generate
  - Web3modal connect button using wagmi-core
- Foundry contracts
  - Configured for easy multi-chain deployments

## Create your dapp with one-click deploy button (recommended)

1. [![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2Fd1onys1us%2Fdapp-slaps&env=VITE_WEB3MODAL_PROJECT_ID&envDescription=Retrieve%20a%20Web3Modal%20project%20ID%20%E2%86%92&envLink=https%3A%2F%2Fcloud.walletconnect.com%2Fsign-in&root-directory=packages%2Fapp)
2. Clone the repo that was created by Vercel
3. Install packages and copy .env.example files:
   `cd <REPLACE_ME_WITH_YOUR_REPO_NAME> && sh setup.sh`
4. Set mnemonic phrase in root `.env` for test accounts ([generate a bip39 mnemonic](https://iancoleman.io/bip39/))
5. Set web3modal project id in `packages/app/.env` ([obtain a project id for web3modal](https://cloud.walletconnect.com/sign-in))
6. Source environment vars: `source .env && source packages/app/.env`

## Create your dapp manually

1. Clone/fork the repo:
   `git clone https://github.com/d1onys1us/dapp-slaps.git`
2. Install packages and copy .env.example files:
   `cd dapp-slaps && sh setup.sh`
3. Set mnemonic phrase in root `.env` for test accounts ([generate a bip39 mnemonic](https://iancoleman.io/bip39/))
4. Set web3modal project id in `packages/app/.env` ([obtain a project id for web3modal](https://cloud.walletconnect.com/sign-in))
5. Source environment vars: `source .env && source packages/app/.env`

## Start the development environment

1. Start local chain: `anvil -m $MNEMONIC`
2. Start ABI generation in separate window: `pnpm wagmi generate --watch ../contracts/broadcast/`
3. Deploy the Foo contract: `forge script Deploy --broadcast --rpc-url $FOUNDRY`
4. Start app: `pnpm -F app dev`

## Faucet links

### Sepolia

- [Receive Ether on Sepolia](https://sepolia-faucet.pk910.de/)

### Taiko

- [Receive Ether on Taiko](https://l2faucet.hackathon.taiko.xyz/)

## Common app commands

#### Start the app locally

```sh
pnpm -F app dev
```

#### Generate typed ABIs from Foundry contracts

```sh
pnpm -F app wagmi-generate
```

#### Automatically generate typed ABIs from Foundry deployments

```sh
pnpm wagmi generate --watch ../contracts/broadcast/
```

## Common Foundry commands

#### Install a Foundry package

1. Start by installing the package (example: openzeppelin-contracts):

```sh
forge install OpenZeppelin/openzeppelin-contracts
```

2. Regenerate the remappings for the contract imports (run this from the project root):

```sh
forge remappings > remappings.txt
```

#### Start local anvil chain from mnemonic

```sh
anvil -m $MNEMONIC
```

#### Deploy contracts to some chain

> Note: some L2s require a `--legacy` flag if EIP-1559 is not yet supported.

```sh
forge script Deploy --broadcast --rpc-url $SEPOLIA
```

## Troubleshooting

- Try resetting account in MetaMask
- Try clearing all browser storage
- Try disconnecting account and reconnecting
- Ensure all env vars are set
