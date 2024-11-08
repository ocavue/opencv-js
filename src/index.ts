import type { CV } from "./types/opencv";

declare function load(): Promise<CV>;

export default load;
