import * as houseRules from "./rules/houseRules";
import { HouseRules } from "./rules/houseRules";
import * as rando from "./rules/rando";

/** The rules for a standard game.
 */
export interface Rules {
  /**
   * The number of cards in each player's hand.
   * @TJS-type integer
   * @minimum 3
   * @maximum 50
   */
  handSize: number;
  /**
   * The score threshold for the game - when a player hits this they win.
   * If not set, then there is end - the game goes on infinitely.
   * @TJS-type integer, undefined
   * @minimum 1
   * @maximum 10000
   */
  scoreLimit?: number;
  houseRules: HouseRules;
  timeLimits?: RoundTimeLimits;
}

export interface Public {
  handSize: number;
  scoreLimit?: number;
  houseRules: houseRules.Public;
  roundTimeLimits?: RoundTimeLimits;
}

/**
 * Indicated what happens when the time limit runs out.
 * "Hard": Non-ready players are automatically set to away.
 * "Soft": Ready players are given the option to set non-ready players to away.
 */
export type TimeLimitMode = "Hard" | "Soft";

/**
 * The amount of time in seconds to limit to.
 * @TJS-type integer
 * @minimum 0
 * @maximum 300
 */
export type TimeLimit = number;

/**
 * The time limits for the stages of a round.
 */
export interface RoundTimeLimits {
  mode: TimeLimitMode;
  /**
   * The time limit for players to make their play.
   */
  playing: TimeLimit;
  /**
   * The time limit for the judge  to reveal the plays.
   */
  revealing: TimeLimit;
  /**
   * The time limit for the judge to pick a winner.
   */
  judging: TimeLimit;
  /**
   * The amount of time in seconds after one round completes the next one
   * starts.
   */
  complete: TimeLimit;
}

export const defaultTimeLimits = (): RoundTimeLimits => ({
  mode: "Soft",
  playing: 60,
  revealing: 30,
  judging: 30,
  complete: 10
});

/**
 * Create a default set of rules.
 */
export const create = (): Rules => ({
  handSize: 10,
  scoreLimit: 25,
  houseRules: houseRules.create()
});

/**
 * Configuration for the "Packing Heat" house rule.
 */
export interface PackingHeat {}

/**
 * Configuration for the "Reboot the Universe" house rule.
 * This rule allows players to draw a new hand by sacrificing a given number
 * of points.
 */
export interface Reboot {
  /**
   * The cost to redrawing.
   * @TJS-type integer
   * @minimum 1
   * @maximum 50
   */
  cost: number;
}

export const censor = (rules: Rules): Public => ({
  ...rules,
  houseRules: houseRules.censor(rules.houseRules)
});

export interface ChangeBase<Name extends string, HouseRule> {
  houseRule: Name;
  settings?: HouseRule;
}

export type ChangePackingHeat = ChangeBase<"PackingHeat", PackingHeat>;
export type ChangeRando = ChangeBase<"Rando", rando.Public>;
export type ChangeReboot = ChangeBase<"Reboot", Reboot>;

export type Change = ChangePackingHeat | ChangeRando | ChangeReboot;