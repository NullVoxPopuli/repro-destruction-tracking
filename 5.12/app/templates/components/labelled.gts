export const Labelled = <template>
  <fieldset><legend>{{@name}}</legend>
    {{yield}}
  </fieldset>
</template>;
