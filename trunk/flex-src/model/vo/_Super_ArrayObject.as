/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - ArrayObject.as.
 */

package model.vo
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.util.FiberUtils;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.Event;
import flash.events.EventDispatcher;
import mx.binding.utils.ChangeWatcher;
import mx.collections.ArrayCollection;
import mx.events.PropertyChangeEvent;
import mx.validators.ValidationResult;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_ArrayObject extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
        try
        {
            if (flash.net.getClassByAlias("ArrayObject") == null)
            {
                flash.net.registerClassAlias("ArrayObject", cz);
            }
        }
        catch (e:Error)
        {
            flash.net.registerClassAlias("ArrayObject", cz);
        }
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _ArrayObjectEntityMetadata;
    model_internal var _changedObjects:mx.collections.ArrayCollection = new ArrayCollection();

    public function getChangedObjects() : Array
    {
        _changedObjects.addItemAt(this,0);
        return _changedObjects.source;
    }

    public function clearChangedObjects() : void
    {
        _changedObjects.removeAll();
    }

    /**
     * properties
     */
    private var _internal_STD_PROP_LIST : Object;
    private var _internal_ARRAY_AS_PROPS : Object;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_ArrayObject()
    {
        _model = new _ArrayObjectEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "STD_PROP_LIST", model_internal::setterListenerSTD_PROP_LIST));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "ARRAY_AS_PROPS", model_internal::setterListenerARRAY_AS_PROPS));

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get STD_PROP_LIST() : Object
    {
        return _internal_STD_PROP_LIST;
    }

    [Bindable(event="propertyChange")]
    public function get ARRAY_AS_PROPS() : Object
    {
        return _internal_ARRAY_AS_PROPS;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set STD_PROP_LIST(value:Object) : void
    {
        var oldValue:Object = _internal_STD_PROP_LIST;
        if (oldValue !== value)
        {
            _internal_STD_PROP_LIST = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "STD_PROP_LIST", oldValue, _internal_STD_PROP_LIST));
        }
    }

    public function set ARRAY_AS_PROPS(value:Object) : void
    {
        var oldValue:Object = _internal_ARRAY_AS_PROPS;
        if (oldValue !== value)
        {
            _internal_ARRAY_AS_PROPS = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "ARRAY_AS_PROPS", oldValue, _internal_ARRAY_AS_PROPS));
        }
    }

    /**
     * Data/source property setter listeners
     *
     * Each data property whose value affects other properties or the validity of the entity
     * needs to invalidate all previously calculated artifacts. These include:
     *  - any derived properties or constraints that reference the given data property.
     *  - any availability guards (variant expressions) that reference the given data property.
     *  - any style validations, message tokens or guards that reference the given data property.
     *  - the validity of the property (and the containing entity) if the given data property has a length restriction.
     *  - the validity of the property (and the containing entity) if the given data property is required.
     */

    model_internal function setterListenerSTD_PROP_LIST(value:flash.events.Event):void
    {
        _model.invalidateDependentOnSTD_PROP_LIST();
    }

    model_internal function setterListenerARRAY_AS_PROPS(value:flash.events.Event):void
    {
        _model.invalidateDependentOnARRAY_AS_PROPS();
    }


    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();
        var validationFailureMessages:Array = new Array();

        var propertyValidity:Boolean = true;
        if (!_model.STD_PROP_LISTIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_STD_PROP_LISTValidationFailureMessages);
        }
        if (!_model.ARRAY_AS_PROPSIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_ARRAY_AS_PROPSValidationFailureMessages);
        }

        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && propertyValidity;
    }

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
        var oldValue:Boolean = model_internal::_isValid;
        if (oldValue !== value)
        {
            model_internal::_isValid = value;
            _model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }
    }

    /**
     * derived property getters
     */

    [Transient]
    [Bindable(event="propertyChange")]
    public function get _model() : _ArrayObjectEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _ArrayObjectEntityMetadata) : void
    {
        var oldValue : _ArrayObjectEntityMetadata = model_internal::_dminternal_model;
        if (oldValue !== value)
        {
            model_internal::_dminternal_model = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }
    }

    /**
     * methods
     */


    /**
     *  services
     */
    private var _managingService:com.adobe.fiber.services.IFiberManagingService;

    public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
    {
        _managingService = managingService;
    }

    model_internal function set invalidConstraints_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_invalidConstraints;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;
            _model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);
        }
    }

    model_internal function set validationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_validationFailureMessages;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;
            _model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);
        }
    }

    model_internal var _doValidationCacheOfSTD_PROP_LIST : Array = null;
    model_internal var _doValidationLastValOfSTD_PROP_LIST : Object;

    model_internal function _doValidationForSTD_PROP_LIST(valueIn:Object):Array
    {
        var value : Object = valueIn as Object;

        if (model_internal::_doValidationCacheOfSTD_PROP_LIST != null && model_internal::_doValidationLastValOfSTD_PROP_LIST == value)
           return model_internal::_doValidationCacheOfSTD_PROP_LIST ;

        _model.model_internal::_STD_PROP_LISTIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isSTD_PROP_LISTAvailable && _internal_STD_PROP_LIST == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "STD_PROP_LIST is required"));
        }

        model_internal::_doValidationCacheOfSTD_PROP_LIST = validationFailures;
        model_internal::_doValidationLastValOfSTD_PROP_LIST = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfARRAY_AS_PROPS : Array = null;
    model_internal var _doValidationLastValOfARRAY_AS_PROPS : Object;

    model_internal function _doValidationForARRAY_AS_PROPS(valueIn:Object):Array
    {
        var value : Object = valueIn as Object;

        if (model_internal::_doValidationCacheOfARRAY_AS_PROPS != null && model_internal::_doValidationLastValOfARRAY_AS_PROPS == value)
           return model_internal::_doValidationCacheOfARRAY_AS_PROPS ;

        _model.model_internal::_ARRAY_AS_PROPSIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isARRAY_AS_PROPSAvailable && _internal_ARRAY_AS_PROPS == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "ARRAY_AS_PROPS is required"));
        }

        model_internal::_doValidationCacheOfARRAY_AS_PROPS = validationFailures;
        model_internal::_doValidationLastValOfARRAY_AS_PROPS = value;

        return validationFailures;
    }
    

}

}
