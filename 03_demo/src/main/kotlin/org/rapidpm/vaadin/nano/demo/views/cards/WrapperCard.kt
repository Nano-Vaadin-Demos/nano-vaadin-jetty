/**
 * Copyright © 2013 Sven Ruppert (sven.ruppert@gmail.com)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.rapidpm.vaadin.nano.demo.views.cards

import com.vaadin.flow.component.Component
import com.vaadin.flow.component.html.Div

class WrapperCard(className: String, components: Array<Component>,
                  vararg classes: String) : Div() {
  init {
    addClassName(className)
    val card = Div()
    card.addClassNames(*classes)
    card.add(*components)
    add(card)
  }
}
