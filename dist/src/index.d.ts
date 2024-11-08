import type { CV } from "./types/opencv";
declare function load(): Promise<typeof CV>;
export type { CV };
export default load;
