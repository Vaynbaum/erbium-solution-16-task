import { Language } from './language.model';

export class LanguageIntern {
  constructor(
    public language_id: number,
    public intern_id: number,
    public language: Language
  ) {}
}
