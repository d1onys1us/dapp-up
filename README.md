## What's included

A monorepo with:

- Svelte frontend
  - Auto-generated and fully-typed ABI's from wagmi-generate and Foundry plugin
  - Web3modal connect button using wagmi core
- Foundry backend
  - Configurations for easy multi-chain deployments
- Automated Fleek (IPFS) deployments

## Quickstart

1. Click "Use this template" > "Create a new repository" > "Create repository from template"
2. Clone repo (eg. `git clone https://github.com/repo_name`) and `cd <repo_name>`
3. Execute the setup script `sh setup.sh` (installs foundry deps, node deps, copies env files)
4. [Obtain a mnemonic](https://iancoleman.io/bip39/) for test accounts.
   a. Set mnemonic phrase in `packages/app.env`
5. [Obtain a project id for web3modal](https://cloud.walletconnect.com/sign-in).
   a. Set web3modal project id in `packages/app/.env`
6. Load environment files: `source .env && source packages/app/.env`

Your environment is ready to go! Use these commands to get started deploying a contract and start buidling.

1. Start local chain: `anvil -m $MNEMONIC`
2. Start ABI generation in separate window: `pnpm wagmi generate --watch ../contracts/broadcast/`
3. Deploy the Foo contract: `forge script Deploy --broadcast --rpc-url $ANVIL`
4. Start app: `pnpm -F app dev`

## Deploy to Fleek

> This will automatically deploy previews on branches as well.

1. [Sign up for fleek and connect GitHub repo](https://fleek.xyz)
2. Copy all `packages/app/.env` into Fleek project
3. Enable preview deploys

## Common commands

### Start local anvil chain

```sh
anvil -m "$MNEMONIC"
```

### Get current block number with cast

```sh
cast block-number
```

### Deploy contracts to some chain

> Note: some L2s require a `--legacy` flag if EIP-1559 is not yet supported.

```sh
forge script Deploy --broadcast --rpc-url "$SEPOLIA"
```

### Automatically generate ABIs from contract deployments

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

- Reset account on Metamask
- Clear all browser storage
- Disconnect account and re-connect
