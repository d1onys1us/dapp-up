import { writable } from "svelte/store";
import type { Web3Modal } from "@web3modal/html";
export const web3modal = writable<Web3Modal>();
