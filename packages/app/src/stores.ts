import { writable } from "svelte/store";
import type { EthereumClient } from "@web3modal/ethereum";
import type { Client } from "@wagmi/core";
import type { Web3Modal } from "@web3modal/html";
import type { ethers } from "ethers";

export const ethereumClient = writable<EthereumClient>();
export const wagmiClient = writable<Client>();
export const web3Modal = writable<Web3Modal>();
export const providers = writable<{ [chainId: number]: ethers.providers.JsonRpcProvider }>();
