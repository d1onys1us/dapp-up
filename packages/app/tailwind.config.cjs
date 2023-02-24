/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js,svelte,ts}"],
  daisyui: {
    // themes: [
    //   // add a custom theme: https://daisyui.com/theme-generator/
    //   {
    //     mytheme: {
    //       primary: "#4aef73",
    //       secondary: "#b0d7f4",
    //       accent: "#e05557",
    //       neutral: "#362438",
    //       "base-100": "#333135",
    //       info: "#99C6EA",
    //       success: "#6AE2BA",
    //       warning: "#F4D32F",
    //       error: "#F42815",
    //     },
    //   },
    // ],
  },
  theme: {
    extend: {},
  },
  plugins: [require("daisyui")],
};
