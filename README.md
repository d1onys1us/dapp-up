## What's included

- One click to launch dapp on Vercel
- Svelte app
  - Auto-generated and fully-typed ABIs using wagmi-generate
  - Web3modal connect button using wagmi-core
- Foundry contracts
  - Configured for easy multi-L2 deployments

## Create your L2 dapp with one click

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2Fd1onys1us%2Fdapp-slaps&env=VITE_WEB3MODAL_PROJECT_ID&build-command=pnpm%20-F%20app%20build%3Aproduction&root-directory=packages%2Fapp&output-directory=dist)

## Manual setup

1. Click "Use this template" > "Create a new repository" > "Create repository from template"
2. Clone repo (eg. `git clone https://github.com/repo_name`) and `cd <repo_name>`
3. Execute the setup script `sh setup.sh` (installs foundry deps, node deps, copies env files)
4. [Obtain a mnemonic](https://iancoleman.io/bip39/) for test accounts.
   a. Set mnemonic phrase in `packages/app/.env`
5. [Obtain a project id for web3modal](https://cloud.walletconnect.com/sign-in).
   a. Set web3modal project id in `packages/app/.env`
6. Load environment files: `source .env && source packages/app/.env`

Now you're environment is ready to go! Use these commands to get started deploying a contract and start buidling.

1. Start local chain: `anvil -m $MNEMONIC`
2. Start ABI generation in separate window: `pnpm wagmi generate --watch ../contracts/broadcast/`
3. Deploy the Foo contract: `forge script Deploy --broadcast --rpc-url $ANVIL`
4. Start app: `pnpm -F app dev`

## Common commands

### Start local anvil chain

```sh
anvil -m $MNEMONIC
```

### Get current block number with cast

```sh
cast block-number
```

### Deploy contracts to some chain

> Note: some L2s require a `--legacy` flag if EIP-1559 is not yet supported.

```sh
forge script Deploy --broadcast --rpc-url $SEPOLIA
```

### Re-generate ABIs from foundry

```sh
pnpm -F app wagmi-generate
```

### Watch contract deployment and automatically generate ABIs

```sh
pnpm wagmi generate --watch ../contracts/broadcast/
```

### Install a foundry package

Example insalling openzeppelin:

```sh
forge install OpenZeppelin/openzeppelin-contracts
```

Regenerate remappings importing in the contracts (from the project root):

```sh
forge remappings > remappings.txt
```

## Troubleshooting

- try reset account metamask
- try clearing all browser storage
- try disconnecting account and re-connecting
